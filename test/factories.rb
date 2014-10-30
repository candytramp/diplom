FactoryGirl.define do  factory :textbook do
    isbn "MyString"
title "MyText"
publisher "MyText"
year 1
grif "MyText"
publish_year 1
pages "9.99"
textbook_type "MyText"
  end
  factory :monograph do
    isbn "MyString"
name "MyText"
publisher "MyText"
year 1
publisher_name "MyText"
publish_year 1
pages "9.99"
  end
  factory :exhibit do
    name "MyText"
year 1
exhibition nil
  end
  factory :exhibition do
    name "MyText"
etype "MyText"
country "MyText"
city "MyText"
start "2014-10-30"
finish "2014-10-30"
year 1
creator_login "MyString"
creator_data "MyText"
  end
  factory :diploma do
    name "MyText"
issue_date "2014-10-30"
issue_organization "MyText"
year 1
creator_login "MyString"
creator_data "MyText"
  end


	factory :source do
	end
  trait :fed_funding_source do
		funding_source 'Fed source'
	end
	trait :mun_funding_source do
		funding_source 'F source'
	end

	
	factory :article do
		name					"Art1" 
    source 				{ { type: 'журнал', name: 'WorldOfScience', year: 2010, output: 5, is_russian: 'yu', in_rinc: 'hh6rh6' } } 
   	start_page		3
    finish_page		10
    link					"http://guides.rubyonrails.org/testing.html"
    year					2010
	end

	factory :person do
		last_name			'Sun'
    first_name		'Helen'
    birthday      Date.today - 25.years
	end

	factory :article_author do
		article             
    person               
    old_lastname	'Dun'
	end

  trait :author_with_boolean_fields do
		is_teacher 			true
    is_staffteacher false
    is_student			false
    is_postgrad			false
	end


end
