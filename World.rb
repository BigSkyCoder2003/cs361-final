class World
  def initialize(name, things)
    @name = name
    @features = things
  end
    def add_feature(f)
      @features.append(t)
    end
  
    def to_geojson(indent=0)
      # generate geoJSON output heading
      s = '{"type": "FeatureCollection","features": ['
      @features.each_with_index do |f,i|
        if i != 0
          s +=","
        end
       s += f.get_json_feature
      end
      s + "]}"
    end
  end