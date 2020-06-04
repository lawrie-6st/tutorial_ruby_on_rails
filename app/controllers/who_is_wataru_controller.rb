# frozen_string_literal: true

class WhoIsWataruController < ApplicationController
  def self_introduce
    # 描画するviewfileを選択している。
    # もし、変数を表示したい場合は描画する前にここに記載する。
    #
    render 'who_is_wataru/main'
  end
end
