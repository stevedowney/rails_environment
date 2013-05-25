require 'spec_helper'

module Rails
  module_function
  
  def root
    Pathname.new(File.dirname(__FILE__))
  end
  
  def env
    'development'
  end
end

describe RailsEnvironment do

  it ".environments" do
    RailsEnvironment.environments.sort.should == %w(development production staging)
  end

  it '.<environment>?' do
    RailsEnvironment.development?.should be_true
    RailsEnvironment.production?.should be_false
    RailsEnvironment.staging?.should be_false
  end

  it '.not_<environment>?' do
    RailsEnvironment.not_development?.should be_false
    RailsEnvironment.not_staging?.should be_true
    RailsEnvironment.not_production?.should be_true
  end
  
  it '.<env 1>_or_<env 2>?' do
    RailsEnvironment.development_or_staging?.should be_true
    RailsEnvironment.production_or_staging?.should be_false
  end
  
  it '.not_<env 1>_or_<env 2>?' do
    RailsEnvironment.not_development_or_staging?.should be_false
    RailsEnvironment.not_production_or_staging?.should be_true
  end
  
  it 'Error' do
    expect { RailsEnvironment.foo }.
      to raise_error(NoMethodError) {|e| e.name == :things }
  end
end