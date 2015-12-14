module SartuHelper
  def huproyecto (p, u)
    #Horas de un usuario en un proyecto
    Parte.sum(:horas, :conditions=>['proyecto_id = ? and user_id = ?', p, u])
  end

  def husemana (s, u)
    #Horas de un usuario en una semana
    Parte.sum(:horas, :conditions=>['semana = ? and user_id = ?', s, u])
  end

  def semanasanho (arg)
    nyear=Integer(arg.to_s)
    d=Date.commercial(nyear)
    a=Array.new
    for i in 1..52
      s="%02d" % i
      a << d.strftime("#{nyear}-#{s} (%d %b")+(d+6).strftime(" - %d %b)")
      d+=7
    end
    return a
  end

end
