class Document < ActiveRecord::Base
	mount_uploader :file_document, FileDocumentUploader

	belongs_to :user

	validates_integrity_of :file_document
	validates_processing_of :file_document

end
