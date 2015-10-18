FactoryGirl.define do
  factory :order do
    item_desc 'buy milk at Speti'
    to 'Invalienstr 16, Berlin'
    from 'Friedrichstr. 99, Berlin'
    to_geo_latitude "52.51916" 
    to_geo_longitude "13.34542" 
    from_geo_latitude "52.50948" 
    from_geo_longitude "13.59148"
  end

end
