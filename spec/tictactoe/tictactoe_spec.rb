class Welcome
    def greetings
        "Welcome"
    end
end

describe Welcome do
    context 'welcome' do
        it 'should display welcome' do
            greet = Welcome.new
            expect(greet.greetings).to eq("Welcome")
        end
    end
end