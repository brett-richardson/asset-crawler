describe 'Find-A-Boffin namespace', ->
  beforeEach -> @subject = window.FindABoffin

  it 'is an object', -> expect( @subject ).toEqual jasmine.any Object
