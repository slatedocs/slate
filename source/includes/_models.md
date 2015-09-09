# Canonical Data Model
## School

```ruby
{
  :school_core_id=>"KB-Organization-1045",
  :name=>"Faria International School",
  :subdomains=>{:is=>"faria"},
  :address=>"No 11 Chatham Path",
  :address_ii=>nil,
  :city=>"",
  :state=>"",
  :postal_code=>"",
  :country_alpha2=>"HK",
  :timezone=>"Hong Kong",
  :academic_year_start_date=>Thu, 01 Aug 2013,
  :url=>nil,
  :phone=>nil,
  :northern_hemisphere=>nil,
  :mq_enabled_vector_clock=>true,
  :ib_school_code=>nil
}
```

## Year Grade
```ruby
{
  :label => "Grade 15"
  :number => 15
  :program_core_id => "IS-Program-2020"
  :school_core_id =>"KB-Organization-712"
  :enable => false
}

```

## Program
```ruby
{
  :name => "IB Primary Years"
  :program_core_id => "OA-Program-4211"
  :school_core_id => "KB-Organization-1045"
}
```  

## Academic Year
```ruby
{
  :school_core_id => "KB-Organization-2786",
  :name => "2015-2016 Academic Year",
  :year => 2015,
  :academic_year_core_id => "IS-AcademicYear-1",
  :starts_on => "2015-08-01",
  :ends_on => "2016-07-31",
}
```
## Student


```ruby
{
 :id => 2,
 :student_core_id => "MB-User-10857745",
 :first_name => "Aaron",
 :last_name => "Gindo",
 :preferred_name => "Angy",
 :other_name => "" ,
 :birth_date => "1999-04-19",
 :gender=> "M",
 :photo=> nil,
 :year_grade_number => 12,
 :email => "aaron.gindo@eduvo.com",
 :phones => [
    { "number" => "", "type" => "Home" },
    { "number" => "", "type" => "Mobile" }
  ],
 :addresses=>
  [
    {
      "address"=>"",
      "address_ii"=>"",
      "city"=>"",
      "country_alpha2"=>"",
      "state"=>"",
      "postal_code"=>"",
      "type"=>"Home"
    }
  ],
 :status => "enrolled",
 :student_id_number=> "",
 :enrollment_year => 2014,
 :enrollment_start_date => "2014-08-11",
 :graduated_on=>nil,
 :withdrawn_on=>nil,
 :nationalities=>[],
 :languages=>[],
 :relationships=>[],
 :homeroom_advisor_core_id=>"MB-User-10752546",
 :archived=>false,
}
```

## Parent
```ruby
{
  :school_core_id => "KB-Organization-1045"
  :id =>777472
  :parent_core_id =>"OA-Parent-2494"
  :name => "Philip Anderson"
  :first_name => "Philip"
  :last_name => "Anderson"
  :title => "Director"
  :employer => nil
  :preferred_name => nil
  :other_name => nil
  :salutation => nil
  :birth_date => "05/06/1977"
  :gender => "M"
  :photo => nil
  :email => "ja@eduvo.com"
  :work_email => nil
  :addresses => 
    [
      {
        "type"=>"Home", 
        "address"=>"Baker Street", 
        "address_ii"=>nil, 
        "city"=>"Austin", 
        "state"=>"Texus", 
        "postal_code"=>nil, 
        "country_alpha2"=>nil
      }
    ]
  :phones => 
    [
      {
        "type"=>"Mobile",
        "number"=>nil
      }, 
      {
        "type"=>"Work", 
        "number"=>"415-555-0178"
      },
      {
        "type"=>"Fax", 
         "number"=>nil
      }, 
      {
        "type"=>"WorkFax", 
        "number"=>nil
        }
      }
    ]          
  :nationalities => []
  :languages => []
  :messagings =>nil
  :relationships => 
    [
      {
        :student_core_id=>"OA-Student-4459", 
        :parent_role=>"father", 
        :notification=>true, 
        :position=>1, 
        :school_core_id=>"KB-Organization-1045", 
        :student_core_id=>"OA-Student-77", 
        :parent_role=>"father", 
        :notification=>false, 
        :position=>1, 
        :school_core_id=>"KB-Organization-1045"
      }
    ]  
  :accounts => 
    [
      {
      :is=> 
        {
          :id=>777472
        }, 
      :oa=>
        {
          :id=>2494
          }
        }
  :archived => false
  :mq_deleted => false
}
```

## Relationship
```ruby
{
  :student_core_id =>"OA-Student-86059"
  :parent_core_id =>"OA-Parent-95307"
  :parent_role =>"father"
  :notification =>true
  :position =>1
}
```
## Staff
```ruby
{
  :school_core_id =>"KB-Organization-1045"
  :staff_core_id =>"OA-User-2154"
  :name =>"johnny lu"
  :first_name =>"lu"
  :last_name => "lu"
  :preferred_name =>nil
  :other_name =>nil
  :birth_date =>nil
  :gender =>M
  :photo =>nil
  :email =>jolai@eduvo.com
  :addresses =>[]
  :phones =>
    [
      {
        "type"=> work,
        "Number"=> +852 2820 2910
      }
      {
        "type"=> mobile,
        "NUmber"=>nil
      }
    ]   
  :title =>"oa"
  :roles =>[]
  :nationalities =>[]
  :languages =>[]
  :accounts => 
    [
      {
      :is=> 
        {
          :id=>777472
        }, 
      :oa=>
        {
          :id=>2494
          }
        }
  :archived =>false
  :mq_deleted =>false
}
```