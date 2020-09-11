# :nodoc:
struct Time
  def self.from_tm_ptr(tm : LibC::Tm*)
    secs = LibC.mktime(tm)
    Time.unix(secs)
  end

  def to_tm_ptr
    secs = self.to_unix
    LibC.localtime_r(pointerof(secs), out tm)
    pointerof(tm)
  end
end
