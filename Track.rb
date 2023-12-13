class Track
  def initialize(segments, name=nil)
    @name = name
    segment_objects = []
    segments.each do |s|
      segment_objects.append(TrackSegment.new(s))
    end
    @segments = segment_objects
  end

  def generate_json_feature()
    j = '{'
    j += '"type": "Feature", '
    if @name != nil
      j+= '"properties": {'
      j += '"title": "' + @name + '"'
      j += '},'
    end
    j += '"geometry": {'
    j += '"type": "MultiLineString",'
    j +='"coordinates": ['
    @segments.each_with_index do |segment, index|
      if index > 0
        j += ","
      end
      j += '['
      tsj = ''
      segment.coordinates.each do |c|
        if tsj != ''
          tsj += ','
        end
        tsj += '['
        tsj += "#{c.longitude},#{c.latitude}"
        if c.elevation != nil
          tsj += ",#{c.elevation}"
        end
        tsj += ']'
      end
      j+=tsj
      j+=']'
    end
    j + ']}}'
  end
end