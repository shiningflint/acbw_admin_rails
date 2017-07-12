require 'rails_helper'

RSpec.describe "Routes for static pages", type: :routing do
  it { expect(get: '/about').to route_to(id: 'about', controller: "blog/statics", action: 'show') }
  it { expect(get: '/').to route_to(id: 'index', controller: "blog/statics", action: 'show') }
end
