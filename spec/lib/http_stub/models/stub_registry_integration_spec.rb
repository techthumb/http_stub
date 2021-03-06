describe HttpStub::Models::StubRegistry, "integrating with real stubs" do

  let(:logger)  { double("Logger").as_null_object }
  let(:request) { double("HttpRequest", logger: logger) }

  let(:stub_registry) { HttpStub::Models::StubRegistry.new }

  describe "#recall" do

    subject { stub_registry.recall }

    context "when stubs have been added" do

      let(:stubs) do
        (1..3).map { |i| create_stub(i) }
      end

      before(:example) do
        stubs.each { |stub| stub_registry.add(stub, request) }
      end

      context "and remembered" do

        before(:example) { stub_registry.remember }

        context "and a stub subsequently added" do

          let(:stub_to_add) { create_stub(4) }

          before(:example) { stub_registry.add(stub_to_add, request) }

          it "should restore all known stubs to the remembered state" do
            subject

            expect(stub_registry.all).not_to include(stub_to_add)
          end

        end

      end

    end

  end

  def create_stub(number)
    HttpStub::Models::Stub.new(
      {
        "uri" => "/uri#{number}",
        "method" => "get",
        "headers" => {"header_key_#{number}" => "header_value_#{number}"},
        "parameters" => {"parameter_key_#{number}" => "parameter_value_#{number}"},
        "response" => {
          "status" => 200 + number,
          "body" => "Body #{number}"
        },
        "triggers" => []
      }
    )
  end

end
