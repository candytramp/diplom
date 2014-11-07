
def gen_tests(models)
	models.each do |model|
		if !['concern',""].include?(model)
				print "gen for...............#{model}\n"
				`rails g rspec:model #{model}`
		end
	end
end
def walk(dir)
	models = []
	d = Dir.new(dir)
	d.each do |file|
		models << file.split('.')[0]		
		puts " Got #{file}"	
	end
   p models.compact!
	gen_tests(models)	
end



walk("/mnt/storage1/users/s/so/soa40/Work/NI/app/models")

