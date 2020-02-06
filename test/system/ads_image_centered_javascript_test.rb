require_relative "system_test_helper"

class AdsImageCenteredJavascriptTest < ApplicationSystemTestCase
  include SystemTestHelper

  setup do
    ad_template_setup(ad_template: "image-centered")
  end

  teardown do
    travel_back
  end

  test "image centered - premium ad with light theme" do
    visit advertisement_tests_path(@property, test_country_code: "US")
    assert_creative_headline @premium_campaign
    assert_creative_body @premium_campaign
    assert_campaign_link @premium_campaign
    assert_powered_by_link(text: "This is a premium campaign Premium ethical ad by CodeFund")

    find("div", id: "cf").assert_matches_style("max-width": "280px", "margin": "0px 552px")
    find("span", class: "cf-wrapper").assert_matches_style("display": "block",
                                                           "overflow": "visible",
                                                           "font-size": "14px",
                                                           "line-height": "19.6px",
                                                           "font-family": "Helvetica, Arial, sans-serif",
                                                           "padding": "15px",)
    find("a", class: "cf-sponsored-by").assert_matches_style("box-shadow": "none", "text-decoration": "none solid rgb(0, 0, 238)")
    find("span", class: "cf-img-wrapper").assert_matches_style("display": "block", "margin-bottom": "8px")
    find("img", class: "cf-img").assert_matches_style("max-width": "130px",
                                                      "position": "relative",
                                                      "margin-top": "0px",
                                                      "margin-right": "0px",
                                                      "margin-left": "0px",
                                                      "margin-bottom": "0px",)
    find("span", class: "cf-text").assert_matches_style("color": "rgba(0, 0, 0, 0.6)")
    find("a", class: "cf-powered-by").assert_matches_style("box-shadow": "none",
                                                           "padding": "0px",
                                                           "text-decoration": "none solid rgba(0, 0, 0, 0.7)",
                                                           "margin-top": "5px",
                                                           "font-size": "11px",
                                                           "display": "block",
                                                           "font-weight": "400",
                                                           "text-align": "center",
                                                           "color": "rgba(0, 0, 0, 0.7)",
                                                           "background-color": "rgba(0, 0, 0, 0)",
                                                           "line-height": "15.4px",)
  end

  test "image centered - premium ad with dark theme" do
    @property.update ad_theme: "dark"
    visit advertisement_tests_path(@property, test_country_code: "US")
    assert_creative_headline @premium_campaign
    assert_creative_body @premium_campaign
    assert_campaign_link @premium_campaign
    assert_powered_by_link(text: "This is a premium campaign Premium ethical ad by CodeFund")

    find("div", id: "cf").assert_matches_style("max-width": "280px",
                                               "margin": "0px 552px",
                                               "background-color": "rgba(0, 0, 0, 0.05)",)
    find("span", class: "cf-wrapper").assert_matches_style("display": "block",
                                                           "overflow": "visible",
                                                           "font-size": "14px",
                                                           "line-height": "19.6px",
                                                           "font-family": "Helvetica, Arial, sans-serif",
                                                           "padding": "15px",)
    find("a", class: "cf-sponsored-by").assert_matches_style("box-shadow": "none", "text-decoration": "none solid rgb(0, 0, 238)")
    find("span", class: "cf-img-wrapper").assert_matches_style("display": "block", "margin-bottom": "8px")
    find("img", class: "cf-img").assert_matches_style("max-width": "130px",
                                                      "position": "relative",
                                                      "margin-top": "0px",
                                                      "margin-right": "0px",
                                                      "margin-left": "0px",
                                                      "margin-bottom": "0px",)
    find("span", class: "cf-text").assert_matches_style("color": "rgba(255, 255, 255, 0.8)")
    find("a", class: "cf-powered-by").assert_matches_style("box-shadow": "none",
                                                           "padding": "0px",
                                                           "text-decoration": "none solid rgba(255, 255, 255, 0.7)",
                                                           "margin-top": "5px",
                                                           "font-size": "11px",
                                                           "display": "block",
                                                           "font-weight": "400",
                                                           "text-align": "center",
                                                           "color": "rgba(255, 255, 255, 0.7)",
                                                           "line-height": "15.4px",)
  end

  test "image centered - fallback ad with light theme" do
    @premium_campaign.update keywords: []
    visit advertisement_tests_path(@property, test_country_code: "US")
    assert_creative_headline @fallback_campaign
    assert_creative_body @fallback_campaign
    assert_campaign_link @fallback_campaign
    assert_powered_by_link(text: "This is a fallback campaign Fallback ethical ad by CodeFund")

    find("div", id: "cf").assert_matches_style("max-width": "280px", "margin": "0px 552px")
    find("span", class: "cf-wrapper").assert_matches_style("display": "block",
                                                           "overflow": "visible",
                                                           "font-size": "14px",
                                                           "line-height": "19.6px",
                                                           "font-family": "Helvetica, Arial, sans-serif",
                                                           "padding": "15px",)
    find("a", class: "cf-sponsored-by").assert_matches_style("box-shadow": "none", "text-decoration": "none solid rgb(0, 0, 238)")
    find("span", class: "cf-img-wrapper").assert_matches_style("display": "block", "margin-bottom": "8px")
    find("img", class: "cf-img").assert_matches_style("max-width": "130px",
                                                      "position": "relative",
                                                      "margin-top": "0px",
                                                      "margin-right": "0px",
                                                      "margin-left": "0px",
                                                      "margin-bottom": "0px",)
    find("span", class: "cf-text").assert_matches_style("color": "rgba(0, 0, 0, 0.6)")
    find("a", class: "cf-powered-by").assert_matches_style("box-shadow": "none",
                                                           "padding": "0px",
                                                           "text-decoration": "none solid rgba(0, 0, 0, 0.7)",
                                                           "margin-top": "5px",
                                                           "font-size": "11px",
                                                           "display": "block",
                                                           "font-weight": "400",
                                                           "text-align": "center",
                                                           "color": "rgba(0, 0, 0, 0.7)",
                                                           "background-color": "rgba(0, 0, 0, 0)",
                                                           "line-height": "15.4px",)
  end

  test "image centered - fallback ad with dark theme" do
    @property.update keywords: [], ad_theme: "dark"
    visit advertisement_tests_path(@property, test_country_code: "US")
    assert_creative_headline @fallback_campaign
    assert_creative_body @fallback_campaign
    assert_campaign_link @fallback_campaign
    assert_powered_by_link(text: "This is a fallback campaign Fallback ethical ad by CodeFund")

    find("div", id: "cf").assert_matches_style("max-width": "280px",
                                               "margin": "0px 552px",
                                               "background-color": "rgba(0, 0, 0, 0.05)",)
    find("span", class: "cf-wrapper").assert_matches_style("display": "block",
                                                           "overflow": "visible",
                                                           "font-size": "14px",
                                                           "line-height": "19.6px",
                                                           "font-family": "Helvetica, Arial, sans-serif",
                                                           "padding": "15px",)
    find("a", class: "cf-sponsored-by").assert_matches_style("box-shadow": "none", "text-decoration": "none solid rgb(0, 0, 238)")
    find("span", class: "cf-img-wrapper").assert_matches_style("display": "block", "margin-bottom": "8px")
    find("img", class: "cf-img").assert_matches_style("max-width": "130px",
                                                      "position": "relative",
                                                      "margin-top": "0px",
                                                      "margin-right": "0px",
                                                      "margin-left": "0px",
                                                      "margin-bottom": "0px",)
    find("span", class: "cf-text").assert_matches_style("color": "rgba(255, 255, 255, 0.8)")
    find("a", class: "cf-powered-by").assert_matches_style("box-shadow": "none",
                                                           "padding": "0px",
                                                           "text-decoration": "none solid rgba(255, 255, 255, 0.7)",
                                                           "margin-top": "5px",
                                                           "font-size": "11px",
                                                           "display": "block",
                                                           "font-weight": "400",
                                                           "text-align": "center",
                                                           "color": "rgba(255, 255, 255, 0.7)",
                                                           "line-height": "15.4px",)
  end
end
