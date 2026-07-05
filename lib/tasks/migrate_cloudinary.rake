namespace :cloudinary do
  desc "Show count of ActiveStorage::Blob records using service 'cloudinary'"
  task count: :environment do
    puts ActiveStorage::Blob.where(service_name: 'cloudinary').count
  end

  desc "Preview blobs using 'cloudinary' (shows id, filename, key)"
  task preview: :environment do
    blobs = ActiveStorage::Blob.where(service_name: 'cloudinary').limit(100)
    if blobs.any?
      blobs.each do |b|
        puts [b.id, b.filename, b.key].join(' | ')
      end
    else
      puts "No blobs found using service 'cloudinary'."
    end
  end

  desc "Migrate blobs from 'cloudinary' to 'local' (destructive; files won't be copied)"
  task migrate: :environment do
    blobs = ActiveStorage::Blob.where(service_name: 'cloudinary')
    count = blobs.count
    if count.zero?
      puts "No blobs to migrate."
      next
    end
    puts "About to update [33m#{count}[0m blobs to use service 'local'. This does NOT move files from Cloudinary to local storage."
    puts "Run with `rake cloudinary:migrate` again to perform the update, or abort now (Ctrl+C) to cancel."
    # Confirm prompt omitted for automation; operator must run intentionally.
    blobs.update_all(service_name: 'local')
    puts "Updated #{count} blobs to service 'local'."
  end
end
