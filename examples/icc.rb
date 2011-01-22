#!/usr/bin/ruby
$:.unshift(File.dirname(__FILE__)+'/../lib/')

require 'statsample'

Statsample::Analysis.store(Statsample::Reliability::ICC) do

  size=1000
  a=Statsample::Vector.new_scale(size) {rand(10)}
  b=a.recode{|i|i+rand(4)-2}
  c=a.recode{|i|i+rand(4)-2}
  d=a.recode{|i|i+rand(4)-2}
  @ds={'a'=>a,'b'=>b,'c'=>c,'d'=>d}.to_dataset
  @icc=Statsample::Reliability::ICC.new(@ds)
  summary(@icc)
  @icc.type=:icc_3_1
  summary(@icc)
  @icc.type=:icc_a_k
  summary(@icc)
  
end

if __FILE__==$0
  Statsample::Analysis.run_batch
end
