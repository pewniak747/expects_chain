# expects_chain

expects_chain is an extenstion to Rspec that allows you to set advanced chained expectations on objects. Think of it as Rspec's stub_chain but with mocking / stubbing / arguments support.

Currently supports RSpec & Mocha.

## usage

With expects_chain you can do things like:

Mock a straightforward method chain on your model class:

```ruby
Article.expects_chain(:published, :first).returns(@article_fixture)
Article.published.first #=> @article_fixture
```

Mock method chain with arguments (first symbol in array becomes method name, the rest are passed arguments).

```ruby
Article.expects_chain([:order, "created_at DESC"], :first).returns(@article_fixture)
Article.order("created_at DESC").first #=> @article_fixture
```

```ruby
Article.expects_chain([:where, "author = ? AND published = ?", 'john', true], :first).returns(@article_fixture)
Article.where("author = ? AND published = ?", 'john', true).first #=> @article_fixture
```

Raise an exception at the end of a chain:

```ruby
Article.expects_chain(:first, :publish!).raises(Article::AlreadyPublishedError)
Article.first.publish! #=> Article::AlreadyPublishedError
```

Replace #expects_chain with #stubs_chain if you want stubs instead of mocks.

## installation

Just add to Gemfile:

```ruby
group :test do
  gem 'rspec'
  gem 'expects_chain'
end
```

## license

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

(there be dragons.)
