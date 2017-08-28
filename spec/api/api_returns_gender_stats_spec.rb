require 'rails_helper'
describe 'API', type: :Api do
  context 'Statistics for REGSITRATION data' do
    it 'returns basic raw numbers for all voters' do
      get '/api/registration'
      expect(last_response.status).to be(200)
      json = JSON.parse(last_response.body).first
      expect(json['total_voters']).to eq(4602000)
      expect(json['male_voters']).to eq(2207448)
      expect(json['female_voters']).to eq(2384600)
      expect(json['no_gender_voters']).to eq(9952)
    end
    it 'returns basic raw numbers for voters by city' do
      get '/api/registration?city=seattle'
      expect(last_response.status).to be(200)
      json = JSON.parse(last_response.body).first
      expect(json['total_voters']).to eq(515405)
      expect(json['male_voters']).to eq(253249)
      expect(json['female_voters']).to eq(260939)
      expect(json['no_gender_voters']).to eq(1217)
    end
    it 'returns basic raw numbers for voters by zip' do
      get '/api/registration?zip_code=98108'
      expect(last_response.status).to be(200)
      json = JSON.parse(last_response.body).first
      expect(json['total_voters']).to eq(13574)
      expect(json['male_voters']).to eq(6664)
      expect(json['female_voters']).to eq(6861)
      expect(json['no_gender_voters']).to eq(49)
    end
    it 'returns basic raw numbers for voters by county' do
      get '/api/registration?county=KI'
      expect(last_response.status).to be(200)
      json = JSON.parse(last_response.body).first
      expect(json['total_voters']).to eq(1375098)
      expect(json['male_voters']).to eq(668515)
      expect(json['female_voters']).to eq(703998)
      expect(json['no_gender_voters']).to eq(2585)
    end
    it 'returns basic raw numbers for voters by age range' do
      get '/api/registration?age=20-30'
      expect(last_response.status).to be(200)
      json = JSON.parse(last_response.body).first
      expect(json['total_voters']).to eq(755413)
      expect(json['male_voters']).to eq(367302)
      expect(json['female_voters']).to eq(385630)
      expect(json['no_gender_voters']).to eq(2481)
    end
    it 'returns basic raw numbers for voters by mixed params' do
      get '/api/registration?age=20-30&city=seattle&zip_code=98108'
      expect(last_response.status).to be(200)
      json = JSON.parse(last_response.body).first
      expect(json['total_voters']).to eq(2244)
      expect(json['male_voters']).to eq(1097)
      expect(json['female_voters']).to eq(1139)
      expect(json['no_gender_voters']).to eq(8)
    end
  end
end
