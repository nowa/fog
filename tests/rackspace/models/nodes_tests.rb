Shindo.tests('Fog::Rackspace::LoadBalancer | nodes', ['rackspace']) do

  @service = Fog::Rackspace::LoadBalancer.new
  @lb = @service.load_balancers.create({
      :name => ('fog' + Time.now.to_i.to_s),
      :protocol => 'HTTP',
      :port => 80,
      :virtual_ips => [{ :type => 'PUBLIC'}],
      :nodes => [{ :address => '10.0.0.1', :port => 80, :condition => 'ENABLED'}]
    })
  @lb.wait_for { ready? }

  begin
    collection_tests(@lb.nodes, { :address => '10.0.0.2', :port => 80, :condition => 'ENABLED'}, false) do
      @lb.wait_for { ready? }
    end
  ensure
    @lb.wait_for { ready? }
    @lb.destroy
  end
end
