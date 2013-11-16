class DoSomethingController < ApplicationController
  require 'edan'
  def main
    # generate random integer for random offset value in call.
    # 31,114 is the number of records in the set with images
    random = rand(31114).to_i
    random.inspect # for debugging
    # instantiate edan object.
    eq = EDANQuery.new("DiegosTestApp")
    # make a call for single row with random offset value; but make sure it has an image also.
      res = eq.request("rows=1&start=#{random}&wt=json&fq=online_media_type:Images")
      # parse the results.
      res.code.inspect  # for debugging
      if res.code == "200"
        @fields = JSON.parse(res.body)
      end

    # do something to the results.
    # return the post-processed data to view.
    render
  end
end
