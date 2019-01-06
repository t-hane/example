# filename: index.csv.ruby

require 'csv'

CSV.generate(encoding: 'Windows-31J') do |csv|
    csv << %w[名前 メールアドレス 年齢]
    # csv << ['名前', 'メールアドレス', '年齢']

    @members.each do |member|
        csv << [member.name, member.email, member.age]
    end
end
