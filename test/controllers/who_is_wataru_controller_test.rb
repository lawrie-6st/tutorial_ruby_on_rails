# frozen_string_literal: true

require 'test_helper'
require_relative '../../app/controllers/who_is_wataru_controller'

class WhoIsWataruControllerTest < ActionDispatch::IntegrationTest
   test "can_get_self_introduce" do
      articles = WhoIsWataruController.new.self_introduce
      puts articles

   end
end
