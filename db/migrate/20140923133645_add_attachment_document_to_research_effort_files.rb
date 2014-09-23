class AddAttachmentDocumentToResearchEffortFiles < ActiveRecord::Migration
  def self.up
    change_table :research_effort_files do |t|
      t.attachment :document
    end
  end

  def self.down
    remove_attachment :research_effort_files, :document
  end
end
