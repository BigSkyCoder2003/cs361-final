class World
  def initialize(name, things)
    @name = name
    @features = things
  end
    def add_feature(f)
      @features.append(t)
    end
  
    def generate_geojson(indent=0)
      s = '{"type": "FeatureCollection","features": ['
      @features.each_with_index do |feature,index|
        if index != 0
          s +=","
        end
       s += feature.generate_json_feature
      end
      s + "]}"
    end
  end