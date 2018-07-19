
require 'csv'

namespace :import do 
    task users: :environment do
        #user.csv의 경로를 filename에 저장
        CSV.foreach("app/assets/no_smoking_place.csv", :headers => true) do |row|
            # p row
            #users.csv파일의 각 행을 array 형태로 출력
            Home.create!(row.to_hash)
        end
    end
end

# rake import:users