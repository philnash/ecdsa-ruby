require_relative '../test_helper.rb'

describe EllipticCurve::Signature do
  it 'converts to and from Der' do
    privateKey = EllipticCurve::PrivateKey.new()
    message = "This is a text message"
    signature1 = EllipticCurve::Ecdsa.sign(message, privateKey)
    der = signature1.toDer()
    signature2 = EllipticCurve::Signature.fromDer(der)
    expect(signature1.r).must_equal signature2.r
    expect(signature1.s).must_equal signature2.s
  end
  
  # subHeader("testBase64Conversion")
  it 'converts to and from base64' do
    privateKey = EllipticCurve::PrivateKey.new()
    message = "This is a text message"
    signature1 = EllipticCurve::Ecdsa.sign(message, privateKey)
    base64 = signature1.toBase64()
    signature2 = EllipticCurve::Signature.fromBase64(base64)
    expect(signature1.r).must_equal signature2.r
    expect(signature1.s).must_equal signature2.s
  end
end