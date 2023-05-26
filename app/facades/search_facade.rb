class SearchFacade
  def initialize(nation)
    @nation = nation
  end

  def total_members
    SearchService.nation_members(@nation).count
  end

  def members
    members = SearchService.get_members(@nation)
    members.map do |member_data|
      Member.new(member_data)
    end
  end
end