class Waypoint



  attr_reader :latitude, :longitude, :elevation, :name, :type
  
    def initialize(longitude, latitude, elevation=nil, name=nil, type=nil)
      @latitude = latitude
      @longitude = longitude
      @elevation = elevation
      @name = name
      @type = type
    end
  
    def get_waypoint_json(indent=0)
      j = '{"type": "Feature",'
      # if name is not nil or type is not nil
      j += '"geometry": {"type": "Point","coordinates": '
      j += "[#{@longitude},#{@latitude}"
      if elevation != nil
        j += ",#{@elevation}"
      end
      j += ']},'
      if name != nil or type != nil
        j += '"properties": {'
        if name != nil
          j += '"title": "' + @name + '"'
        end
        if type != nil  # if type is not nil
          if name != nil
            j += ','
          end
          j += '"icon": "' + @type + '"'  # type is the icon
        end
        j += '}'
      end
      j += "}"
      return j
    end
  end