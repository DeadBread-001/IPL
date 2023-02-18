# frozen_string_literal: true

require 'net/http'
require 'nokogiri'

# NumberController
class NumberController < ApplicationController
  def input; end

  def result
    visualise_type = params[:visualise].to_i
    @xml = get_xml_remotely(params[:n])
    if visualise_type <= 2
      xslt = Nokogiri::XSLT(File.read(File.join(Rails.root, 'public', 'style_new.xsl')))
      visualise_type == 1 ? (render html: xslt.transform(@xml).to_s.html_safe) : (render plain: @xml)
    else
      @xml.root.add_previous_sibling Nokogiri::XML::ProcessingInstruction.new(@xml, 'xml-stylesheet',
                                                                              'type="text/xsl" href="/style_new.xsl"')
      if visualise_type == 3 then render xml: @xml
      else
        render plain: @xml end
    end
  end

  def get_xml_remotely(n)
    url = URI.parse("http://localhost:3002?n=#{n}")

    req = Net::HTTP::Get.new(url.to_s)
    res = Net::HTTP.start(url.host, url.port) { |http| http.request(req) }

    @answer = res
    Nokogiri::XML(res.body)
  end
end
