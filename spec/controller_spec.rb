require "spec_helper"

describe "Controller" do
  subject { last_response }

  let(:params) { { secret_text: "WOLVERINES!" } }
  let(:session) { { secret_text: "It has been a red dawn." } }

  describe "get /" do
    before { get "/" }

    it { is_expected.to be_ok }
  end

  describe "get /secret/new" do
    before { get "/secret/new" }

    it "renders the new secret page" do
      expect(last_response.body).to include("Create a New Secret")
    end
  end

  describe "get /secret" do
    it "renders without any secret" do
      get "/secret"
      expect(last_response).to be_ok
    end

    it "renders a secret saved in the session" do
      get "/secret", {}, 'rack.session' => session
      expect(last_response.body).to include("It has been a red dawn.")
    end
  end

  describe "post /secret" do
    before { post "/secret", params }

    it { is_expected.to be_redirect }

    it "redirects to the secret" do
      follow_redirect!
      expect(last_request.url).to match(/\/secret\z/)
    end

    it "saves the secret" do
      follow_redirect!
      expect(last_response.body).to include("WOLVERINES!")
    end
  end
end
