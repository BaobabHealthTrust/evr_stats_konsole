require 'couchrest_model'

class Person < CouchRest::Model::Base
    use_database 'person'

    design do
        view :by_name
        view :current_district_ta,
            :map => "function(doc){
            if (doc['type'] == 'Person'){
                emit([doc.addresses.current_district ,doc.addresses.current_ta], 1);
            }
        }"
    end
    
end
