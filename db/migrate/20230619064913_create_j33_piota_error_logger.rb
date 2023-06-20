class CreateJ33PiotaErrorLogger < ActiveRecord::Migration[7.0]
  def change
    create_table :j33_piota_error_loggers do |t|
      t.integer     :ordering, null: false
      t.integer     :state, null: false, limit: 1
      t.datetime    :created_datetime, null: false
      t.integer     :checked_out, null: false
      t.datetime    :checked_out_time, null: false
      t.integer     :created_by, null: false
      t.integer     :modified_by, null: false
      t.string      :error_prefix, null: false
      t.string      :title, null: false
      t.string      :message, null: false
      t.string      :line, null: false
      t.string      :linesource, null: false
      t.string      :lineoffset, null: false
      t.string      :sourcename, null: false
      t.string      :ip_address, null: false
      t.string      :appname, null: false
      t.string      :piotaappversion, null: false
      t.string      :piotaarch, null: false
      t.string      :piotadevice, null: false
      t.string      :piotauser, null: false
      t.string      :useragent, null: false
      t.string      :xtitaniumid, null: false
      t.string      :device, null: false
      t.text        :devnotes, null: false
      t.string      :raw_error, null: false
      t.text        :raw_header, null: false
      t.string :token, limit: 50, default: nil 
      t.timestamps
    end
  end
end
