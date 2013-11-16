class DoSomethingController < ApplicationController
  require 'edan'
  def main
    # generate random integer for random offset value in call
    random = rand(50000).to_i
    random.inspect
    # instantiate edan object.
    eq = EDANQuery.new("DiegosTestApp")
    # make a call for single row with random offset value.
    res = eq.request("rows=1&start=#{random}&wt=json")
    # parse the results.
    res.code.inspect
    if res.code == "200"
      @fields = JSON.parse(res.body)
    end

    # do something to the results.
    # return the post-processed data to view.
    render
  end
end
