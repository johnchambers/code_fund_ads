pricing_plan = PricingPlan.first_or_create!(name: "2020, 2nd Quarter")

Audience.all.each do |audience|
  Region.all.each do |region|
    Price.create! pricing_plan: pricing_plan, audience: audience, region: region, cpm: audience.ecpm_for_region(region)
  end
end