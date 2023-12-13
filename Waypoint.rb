require 'json'
class Waypoint



  attr_reader :latitude, :longitude, :elevation, :name, :type
  
    def initialize(longitude, latitude, elevation=nil, name=nil, type=nil)
      @latitude = latitude
      @longitude = longitude
      @elevation = elevation
      @name = name
      @type = type
    end
  
    def generate_json_feature(indent=0)
      j = '{"type": "Feature",'
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
        if type != nil
          if name != nil
            j += ','
          end
          j += '"icon": "' + @type + '"'
        end
        j += '}'
      end
      j += "}"
      return j
    end
    
  end