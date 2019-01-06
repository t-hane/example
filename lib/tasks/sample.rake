namespace :sample do
    task list: :environment do
        Member.all.each do |m|
            puts m.name
        end
    end

    task init: :environment do
        Member.create! name: 'hane', email: 't-hane@gc-story.com', age: 47
        Member.create! name: 'hane', email: 't-hane@gc-story.com', age: 47
        Member.create! name: 'hane', email: 't-hane@gc-story.com', age: 47
        Member.create! name: 'hane', email: 't-hane@gc-story.com', age: 47
    end
end
