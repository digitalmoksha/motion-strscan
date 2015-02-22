# Implementation of String#byteslice since RubyMotion (at least as of 3.6)
# does not implement it.
#------------------------------------------------------------------------------
class String

  # To get a byte range out of a possible multibyte string, force encoding to 
  # ASCII-8BIT and use regular string slice, then restore the original encoding
  #------------------------------------------------------------------------------
  def byteslice(*args)
    result = nil
    begin
      enc = self.encoding
      self.force_encoding('ASCII-8BIT')
      result = self.slice(*args)
    ensure
      self.force_encoding(enc)
    end
    result ? result.force_encoding(enc) : nil
  end
end
