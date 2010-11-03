namespace :itunes do 

  ITunesXmlPath = '/Users/johncrepezzi/Music/iTunes/iTunes Music Library.xml'
  ITunesSourceIdentifier = 'iTunes'
  Announce = '*** [iMusic]'

  desc 'Import the standard iTunes XML file'
  task :import_xml => :environment do
    
    puts "#{Announce} Destroying old data"
    Artist.destroy_all

    puts "#{Announce} Loading file at #{ITunesXmlPath}"
    document = Nokogiri::HTML(open(ITunesXmlPath))
    
    puts "#{Announce} Running import... this may take a few minutes"
    document.xpath('//plist/dict/dict[1]/dict').each do |data|
      track = load_track_data(data)
      artist = find_or_create_artist(:name => track[:artist])
      album = find_or_create_album(:name => track[:album], :artist => artist)
      tracks = Track.create(
        :album => album, 
        :name => track[:name],
        :total_time => track[:total_time],
        :location => track[:location]
      )
    end

  end

  private

  def find_or_create_album(attrs)
    if album = Album.find_by_name_and_artist_id(attrs[:name], attrs[:artist].id)
      return album
    end
    Album.create(attrs)
  end

  def find_or_create_artist(attrs)
    if artist = Artist.find_by_name(attrs[:name])
      return artist
    end
    Artist.create(attrs)
  end

  # Why apple can't just use standard XML like the 
  # rest of the world I have no idea
  def load_track_data(data)
    track = Hash.new
    key = nil
    data.children.each do |data|
      if data.name == 'key'
        key = data.text.downcase.underscore.to_sym
      elsif data.name == 'integer'
        track[key] = data.text.to_i
      elsif data.name == 'string'
        track[key] = data.text
      end
    end
    track
  end

end
