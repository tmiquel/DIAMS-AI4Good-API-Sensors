class MyWorker
  def self.work
    DatumMailer.backup_mailer(["camille@alabintheair.cc","remy@alabintheair.cc","nicolas@alabintheair.cc","amine@alabintheair.cc","thibaut@alabintheair.cc","anne@alabintheair.cc"])
    sleep 432000
  end
end
