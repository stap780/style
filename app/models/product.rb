class Product < ActiveRecord::Base
	
	
require 'roo'
require 'roo-xls'

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |homyproduct|
        csv << homyproduct.attributes.values_at(*column_names)
      end
    end
  end
  
  def self.import(file)
	  #Product.destroy_all
    @products = Product.order("id")
    @products.each do |p|
	    p.quantity = 0
	    p.save
	    end

    spreadsheet = open_spreadsheet(file) 
		 
     header = spreadsheet.row(1)
	     
	     (2..spreadsheet.last_row).each do |i|
		     
    row = Hash[[header, spreadsheet.row(i)].transpose]
	    
# 	     foto = spreadsheet.cell(i,'A')
# 	     sku = spreadsheet.cell(i,'B')
# 	     collection = spreadsheet.cell(i,'C')
# 	     complect = spreadsheet.cell(i,'D')
# 	     proba = spreadsheet.cell(i,'E')
# 	     title = spreadsheet.cell(i,'F')
# 	     category = spreadsheet.cell(i,'G')
# 	     gruppa = spreadsheet.cell(i,'H')
# 	     vstavka = spreadsheet.cell(i,'I')
# 	     metalcolor = spreadsheet.cell(i,'J')
# 	     size = spreadsheet.cell(i,'K')
# 	     price = spreadsheet.cell(i,'L')
# 	     quantity = spreadsheet.cell(i,'M')
# 	     weight  = spreadsheet.cell(i,'N').to_f
	     
	     foto = row["ПутьКФото"]
	     sku = row["Номенклатура"]
	     collection = row["Коллекция"]
	     complect = row["Комплект"]
	     proba = row["амПроба"]
	     title = row["амИзделие"].gsub(',',' ')
	     category = row["амКатегория"]
	     gruppa = row["амГруппа"]
	     vstavka = row["амВставка"]
	     metalcolor = row["амЦветМеталла"]
	     size = row["Размер"]
	     price = row["ЦенаЗаШтуку"]
	     quantity = row["Количество"]
	     weight  = row["НоменклатураСреднийВес"].gsub(',','.')

	     product = Product.where(:sku => sku, :collection => collection, :complect => complect, :proba => proba, :title => title, :category => category, :gruppa => gruppa, :vstavka => vstavka, :metalcolor => metalcolor, :size => size)

	   
			if product.present?
				product.each do |p|
				p.update_attributes(:price => price, :quantity => quantity, :weight => weight)
				end
		  else
	     product = Product.create(:foto => foto, :sku => sku, :collection => collection, :complect => complect, :proba => proba, :title => title, :category => category, :gruppa => gruppa, :vstavka => vstavka, :metalcolor => metalcolor, :size => size, :price => price, :quantity => quantity, :weight => weight)
	     end
	    
	     end #конец (2..spreadsheet.last_row).each
			
  end
  
   def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
    when ".csv" then Roo::CSV.new(file.path, csv_options: {col_sep: ";", encoding: "windows-1251:utf-8"})
    when ".xls" then Roo::Excel.new(file.path)
    when ".xlsx" then Roo::Excelx.new(file.path)
    when ".XLS" then Roo::Excel.new(file.path)
    else raise "Unknown file type: #{file.original_filename}"
    end
  end	
	
	
	
end
