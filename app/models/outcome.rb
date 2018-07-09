class Outcome < CouchRest::Model::Base
    use_database 'outcome'

    design do 
        view :by__id
        view :by_person
        view :by_outcome
        view :by_outcome_cause
        view :by_outcome_date,
            :map => "function(doc) {
                if(doc['type'] == 'Outcome') {
                    emit(doc['outcome_date'],1);
                }
            }",
            :reduce => "function(keys, values, rereduce) {
                return sum(values);
            }"
        view :by_person_and_outcome
        view :by_created_at_and_outcome
        view :by_from_district_and_from_ta_and_from_village
        view :by_updated_at
        view :by_created_at
     end
end
