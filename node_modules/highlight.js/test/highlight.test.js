var should = require('chai').should();
var hl = require('../');


describe('highlight', function() {

  describe('#highlightAuto', function() {
    it('should auto determine language', function() {
      var jsString = 'var f = function() { var a = 123; };';
      var out = hl.highlightAuto(jsString);
      out.keyword_count.should.equal(3);
      out.language.should.equal('javascript');
      out.value.should.equal('<span class="keyword">var</span> f = <span class="function"><span class="keyword">function</span><span class="params">()</span> {</span> <span class="keyword">var</span> a = <span class="number">123</span>; };');
    });
  });

  describe('#highlight', function() {
    it('should take a language', function() {
      var jsString = 'var f = function() { var a = 123; };';
      var out = hl.highlight('javascript', jsString);
      out.keyword_count.should.equal(3);
      out.value.should.equal('<span class="keyword">var</span> f = <span class="function"><span class="keyword">function</span><span class="params">()</span> {</span> <span class="keyword">var</span> a = <span class="number">123</span>; };');
    });
  });
});
