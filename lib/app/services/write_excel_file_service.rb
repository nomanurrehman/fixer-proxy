class WriteExcelFileService < ApplicationService
  def initialize(content:)
    @content = content
  end

  def call
    @filename = "#{ENV.fetch('STORAGE_PATH')}#{SecureRandom.alphanumeric}.xlsx"
    @workbook = FastExcel.open(@filename, constant_memory: true)
    @worksheet = @workbook.add_worksheet
    @bold = @workbook.bold_format
    @worksheet.append_row(["message", "price", "date"], @bold)
    for i in 1..1000
      @worksheet.append_row(["Hello", (rand * 10_000_000).round(2), Time.now])
    end
    @workbook.close    
  end
end