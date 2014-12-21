ActiveAdmin.register Content do
belongs_to :keyword
config.clear_action_items!
menu false
navigation_menu :default
controller do
   def resource
     @content = Content.where(id: params[:id]).first!
   end
  def keyword
    @keyword = Keyword.where(id: params[:keyword_id]).first!
  end
#   def collection
#     @keyword = Keyword.find(params[:id])
#     @results = @keyword.results if !@keyword.nil?
#     @search = @results.search(clean_search_params(params[:q]))
#   end
#   def index
#     @q = Result.search(params[:q])
#     @result = @q.result(distinct: true)
#   end
end
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
   permit_params :id, :rank, :result_id, :url, :title, :description, :result, :keyword
show do |content|
  results = keyword.results
  date = results.first.date
  #ranks = Content.where(:url => content.url)
  data = []
  # dates = []
  i = 0
  results.each do |result|
     # if (date + i.days) >= result.date
     #   data << result.contents.where(:url => content.url).first.rank
     # else
     #   data << nil
     # end
     # dates<<i
    while (date + i.days) < result.date
      data << nil
      i=i.next
    end
    data << result.contents.where(:url => content.url).first.rank
    i=i.next
  end

  render partial: 'charts', locals:{

                              date: date.strftime("(%Y, %m, %d)"),
                              #date: dates,
                              data: data.to_json
                          }
end
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end


end
