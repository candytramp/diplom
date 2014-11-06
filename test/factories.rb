FactoryGirl.define do  factory :author_request do
    ois_request nil
person nil
old_lastname "MyString"
is_teacher false
is_staffteacher false
is_student false
is_postgrad false
details "MyText"
  end
  factory :author_monograph do
    monograph nil
person nil
old_lastname "MyString"
is_teacher false
is_staffteacher false
is_student false
is_postgrad false
details "MyText"
pages 1
  end
  factory :people_report do
    report nil
person nil
old_lastname "MyString"
is_teacher false
is_staffteacher false
is_student false
is_postgrad false
details "MyText"
  end
  factory :people_textbook do
    textbook nil
person nil
old_lastname "MyString"
is_teacher false
is_staffteacher false
is_student false
is_postgrad false
details "MyText"
  end
  factory :people_research_effort do
    research_effort nil
person nil
old_lastname "MyString"
is_teacher false
is_staffteacher false
is_student false
is_postgrad false
details "MyText"
person_value ""
role "MyText"
  end
  factory :request_author do
    ois_request nil
person nil
old_lastname "MyString"
is_teacher false
is_staffteacher false
is_student false
is_postgrad false
details "MyText"
  end
  factory :licence_person do
    licence nil
person nil
old_lastname "MyString"
is_teacher false
is_staffteacher false
is_student false
is_postgrad false
details "MyText"
  end
  factory :monograph_author do
    monograph nil
person nil
old_lastname "MyString"
is_teacher false
is_staffteacher false
is_student false
is_postgrad false
details "MyText"
pages 1
  end
  factory :exhibit_person do
    exhibit nil
person nil
old_lastname "MyString"
is_teacher false
is_staffteacher false
is_student false
is_postgrad false
details "MyText"
  end
  factory :exhibition_person do
    exhibition nil
person nil
old_lastname "MyString"
is_teacher false
is_staffteacher false
is_student false
is_postgrad false
details "MyText"
  end
  factory :diploma_person do
    diploma nil
person nil
old_lastname "MyString"
is_teacher false
is_staffteacher false
is_student false
is_postgrad false
details "MyText"
  end
  factory :textbook do
    isbn "MyString"
title "MyText"
publisher "MyText"
grif "MyText"
publish_year 1
pages "9.99"
textbook_type "MyText"
  end
  
=begin factory :monograph do
    isbn "MyString"
		name "MyText"
		publisher "MyText"
		publisher_name "MyText"
		publish_year 1
		pages "9.99"
  end
=end
  factory :diploma do
    name "MyText"
		issue_date "2014-11-05"
		issue_organization "MyText"
		year 1
		creator_login "MyString"
		creator_data "MyText"
		reward nil
  end
 
=begin factory :textbook do
		isbn "MyString"
		title "MyText"
		publisher 'Российское издательство: "Высшая школа"'
		year 2011
		grif 'гриф УМО или НМС'
		publish_year 2015
		pages "229.99"
		textbook_type 'учебник'
  end
=end
  trait :txt_with_bad_grif do
		grif 'bf'
	end
	trait :txt_with_bad_year do
		year Date.today + 3.years
	end
	trait :txt_too_long_isbn do
		isbn "qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq"
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
	end

	trait :art_with_bad_year do
		source 				{ { type: 'журнал', name: 'WorldOfScience', year: 2050, output: 5, is_russian: 'yu', in_rinc: 'hh6rh6' } }
	end
	trait :art_copy_year do
		source 				{ { type: 'журнал', name: 'WorldOfScience', year: 2010, output: 5, is_russian: 'yu', in_rinc: 'hh6rh6' } }
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
