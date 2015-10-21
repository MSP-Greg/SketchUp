# == Purpose
# Creates several faces in SketchUp to show various issues such as right
# hand rule quirks and others involving a 'loop' with non-distinct points
#
module AddFaces
	RenderMode_Shaded = 2
	@@cntr = 1
	@@cntr_edges = -1
	@@draw_edges = 0
	
	def self.run()
		return if UI.messagebox('Program will overwrite current model!', MB_OKCANCEL) == 2
		@@am = Sketchup.active_model
		@@am.start_operation("add_faces example")
		model_setup
		@@timer_id = UI.start_timer(0.5, true) { loop }
	end

	def self.loop()
		m = 2.m
		case @@cntr
		# 1) draw two individual faces, one up, one down
		when 1 then add_xy_square(0  , 0  , 0  , "LightPink", "up", true)
		when 3 then add_xy_square(2*m, 0  , 0  , "LightBlue", "down", true)
		
		# 2) draw four connected faces (2x2), 1st up, remaining down,
		# NOTE - ordered by color - 1st Red, 2nd Green, 3rd Blue, 4th Gray
		when 5  then add_xy_square(5*m, 0  , 0  , "Red",      "up")
		when 7  then add_xy_square(6*m, 1*m, 0  , "Green",    "down")
		when 9  then add_xy_square(6*m, 0  , 0  , "Blue",     "down")
		when 11 then add_xy_square(5*m, 1*m, 0  , "DimGray",  "down")
		
		# 3) same as 2), but different order
		when 13 then add_xy_square(8*m, 0  , 0  , "Red",      "up")
		when 15 then add_xy_square(9*m, 0  , 0  , "Green",    "down")
		when 17 then add_xy_square(8*m, 1*m, 0  , "Blue",     "down")
		when 19 then add_xy_square(9*m, 1*m, 0  , "DimGray",  "down")
		when 21, 23, 25, 27 then edge_cases
		when 29
			UI.stop_timer(@@timer_id)
			@@am.commit_operation
		else
			draw_up_z if ( (@@cntr % 2) == 0)
			if (0 <= @@cntr_edges && @@cntr_edges < @@len)
				if @@cntr_edges < @@len - 1
					@@entities.add_edges( @@pts[@@cntr_edges] , @@pts[@@cntr_edges+1] )
				else
					@@entities.add_edges( @@pts[@@len - 1] , @@pts[0] )
				end
				@@cntr_edges += 1
				if @@cntr_edges == @@len
					@@cntr += 0.5	
					@@cntr_edges = -1
				end
			else
			end
		end
	end

	# Clears all model entities, sets up model with coloring (ColorByMaterial),
	# changes units to meters
	#
	def self.model_setup
		@@entities = Sketchup.active_model.entities
		@@entities.clear!
		ro = @@am.rendering_options
		ro["RenderMode"] = RenderMode_Shaded
		ro["DisplayColorByLayer"] = false
		ro["FaceFrontColor"] = [255,255,255,255]

		# set units to meters
		lo = @@am.options['UnitsOptions']
		lo['LengthFormat'] = Length::Decimal
		lo['LengthPrecision'] = 4
		lo['LengthUnit'] = Length::Meter
	end

	# creates horizontal square faces with origin at x,y,z
	# and back_material set to color.
	# param dir [String] Two options, 'up' and 'down'.  Refers to the 'right-hand-rule'
	#   normal direction.
	# return [void]
	#
	def self.add_xy_square(x, y, z, color, dir, draw_edges = false)
		m2 = 2.m
		m1 = 1.m
		x1 = x ; x2 = x + m2
		y1 = y ; y2 = y + m2 
		
		@@pts = [ [x1, y1, z], [x2, y1, z], [x2, y2, z], [x1, y2, z] ]
		@@len = @@pts.length

		rhr_normal = [0, 0, m1]
		if dir == "down"
			@@pts.reverse!
			pt = @@pts.pop
			@@pts.insert(0, pt)
			rhr_normal = [0, 0, -m1]
		end
		
		if (@@draw_edges == 0) && draw_edges 
			@@cntr -= 0.5
			@@cntr_edges = 0
			@@draw_edges = 1
			return
		end

		@@color = color
		f = @@entities.add_face(@@pts)
		f.back_material = @@color

		# center of square, for normal edge
		@@edge_start = Geom::Point3d.new(x1 + m1, y1 + m1, z)
		# compute end of normal edge
		@@edge_end = @@edge_start + rhr_normal
		@@entities.add_edges(@@edge_start, @@edge_end)
		@@cntr += 1
	end

	# draws face (again) at z = 2.m and optional normal 
	#
	def self.draw_up_z
		up = 5.m
		# move points up
		@@pts.each { |pt| pt[2] = up }
		if (@@draw_edges == 1)
			@@cntr -= 0.5
			@@cntr_edges = 0
			@@draw_edges = 0
			return
		end
		f = @@entities.add_face(@@pts)
		f.back_material = @@color
		if (@@edge_end)
			@@edge_start.z += up
			@@edge_end[2] += up
			@@entities.add_edges(@@edge_start, @@edge_end)
		end
		@@cntr += 1
	end
	
	# draws some examples of loops with non-unique points.  In Ruby terms,
	# pts.length > pts.uniq.length.  The first example is what I call a
	# sliced donut, the second is a figure eight.
	#
	def self.edge_cases
		m =  2.m
		m5 = 10.m
		@@edge_end = nil
		case @@cntr
		# Sliced Donuts
		when 21
			# Inner & outer loops are opposite directions
			x1 = 12 * m ; x2 = 13 * m ; x3 = 15 * m ; x4 = 16 * m
			y1 =  0     ; y2 =  1 * m ; y3 =  3 * m ; y4 =  4 * m
			@@pts = [ [x1, y1, 0] , [x4, y1, 0] , [x4, y4, 0] , [x3, y3, 0] , [x3, y2, 0] , [x2, y2, 0] , [x2, y3, 0] , [x3, y3, 0] , [x4, y4, 0] , [x1, y4, 0] ]
			@@color = "Orange"
		when 23
			# Inner & outer loops are same directions
			x1 = 18 * m ; x2 = 19 * m ; x3 = 21 * m ; x4 = 22 * m
			y1 =  0     ; y2 =  1 * m ; y3 =  3 * m ; y4 =  4 * m
			@@pts = [ [x1, y1, 0] , [x4, y1, 0] , [x4, y4, 0] , [x3, y3, 0] , [x2, y3, 0] , [x2, y2, 0] , [x3, y2, 0] , [x3, y3, 0] , [x4, y4, 0] , [x1, y4, 0] ]
			@@color = "Yellow"
		
		# Figure Eights
		when 25
			# loops opposite directions, sort of like one would write it
			x1 = 24 * m ; x2 = 26 * m ; x3 = 28 * m
			y1 =  0     ; y2 =  2 * m ; y3 =  4 * m
			@@pts = [ [x1, y1, 0] , [x2, y1, 0] , [x2, y2, 0] , [x2, y3, 0] , [x3, y3, 0] , [x3, y2, 0] , [x2, y2, 0] , [x1, y2, 0] ]
			@@color = "Purple"
		when 27
			#loops same direction
			x1 = 30 * m ; x2 = 32 * m ; x3 = 34 * m
			y1 =  0     ; y2 =  2 * m ; y3 =  4 * m
			@@pts = [ [x1, y1, 0] , [x2, y1, 0] , [x2, y2, 0] , [x3, y2, 0] , [x3, y3, 0] , [x2, y3, 0] , [x2, y2, 0] , [x1, y2, 0] ]
			@@color = "Pink"
		end
		@@len = @@pts.length
		if (@@draw_edges == 0)
			@@cntr -= 0.5
			@@cntr_edges = 0
			@@draw_edges = 1
			return
		end
		f = @@entities.add_face(@@pts)
		f.back_material = @@color
		@@cntr += 1
	end
end

AddFaces.run
# remove from environment
v = $VERBOSE
$VERBOSE = nil
	AddFaces = nil
	Object.send(:remove_const, :AddFaces)
$VERBOSE = v
