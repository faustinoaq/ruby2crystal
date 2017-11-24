class HomeController < ApplicationController
  property found = [] of String
  def index
    render("index.slang")
  end

  def search
    found.clear
    if gem = params["gem"]?
      begin
        msg = `gem install #{gem}`
        if msg =~
         /ERROR:/
          raise "gem not found"
        end
        found << "send found: #{`grep -rn "\.\s*send" ~/.gem/ruby/*/gems/#{gem}-*/lib`.split('\n').size}\n"
        found << "class << found: #{`grep -rn "class <<" ~/.gem/ruby/*/gems/#{gem}-*/lib`.split('\n').size}\n"
        found << "$` found: #{`grep -rn "$\`" ~/.gem/ruby/*/gems/#{gem}-*/lib`.split('\n').size}\n"
        found << "Enumerable#detect found: #{`grep -rn "\.\s*detect" ~/.gem/ruby/*/gems/#{gem}-*/lib`.split('\n').size}\n"
        found << "Enumerable#collect found: #{`grep -rn "\.\s*collect" ~/.gem/ruby/*/gems/#{gem}-*/lib`.split('\n').size}\n"
        found << "Enumerable#respond_to? found: #{`grep -rn "\.\s*respond_to?" ~/.gem/ruby/*/gems/#{gem}-*/lib`.split('\n').size}\n"
        found << "length found: #{`grep -rn "\.\s*length" ~/.gem/ruby/*/gems/#{gem}-*/lib`.split('\n').size}\n"
        found << "and found: #{`grep -rn "\s+and\s+" ~/.gem/ruby/*/gems/#{gem}-*/lib`.split('\n').size}\n"
        found << "or found: #{`grep -rn "\s+or\s+" ~/.gem/ruby/*/gems/#{gem}-*/lib`.split('\n').size}\n"
        found << "posibble autosplat found: #{`grep -rn "\[\s*\[" ~/.gem/ruby/*/gems/#{gem}-*/lib`.split('\n').size}\n"
        found << "each found (returns nil in crystal): #{`grep -rn "\.\s*each" ~/.gem/ruby/*/gems/#{gem}-*/lib`.split('\n').size}\n"
        found << "simple quote found (use double quotes in crystal): #{`grep -rn "\'[\s\S]+\'" ~/.gem/ruby/*/gems/#{gem}-*/lib`.split('\n').size}\n"
        found << "for loop found (use times or each in crystal): #{`grep -rn "\s*for\s+" ~/.gem/ruby/*/gems/#{gem}-*/lib`.split('\n').size}\n"
        found << "attr_accessor found (use property keyword in crystal): #{`grep -rn "attr_accessor" ~/.gem/ruby/*/gems/#{gem}-*/lib`.split('\n').size}\n"
        found << "attr_getter found (use getter keyword in crystal): #{`grep -rn "attr_getter" ~/.gem/ruby/*/gems/#{gem}-*/lib`.split('\n').size}\n"
        found << "attr_setter found (use setter keyword in crystal): #{`grep -rn "attr_setter" ~/.gem/ruby/*/gems/#{gem}-*/lib`.split('\n').size}\n"
      rescue ex
        flash["error"] = ex.message.to_s
      end
      render("index.slang")
    else
      raise Amber::Exceptions::RouteNotFound.new(request)
    end
  end
end
