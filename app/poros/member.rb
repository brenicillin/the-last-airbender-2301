class Member
  attr_reader :name,
              :allies,
              :enemies,
              :affiliation,
              :photo_url
  def initialize(data)
    @name = data[:name]
    @allies = data[:allies].join(', ')
    @enemies = data[:enemies].join(', ')
    @affiliation = data[:affiliation]
    @photo_url = data[:photoUrl]
  end
end