#include "cinder/app/App.h"
#include "cinder/app/RendererGl.h"
#include "cinder/gl/gl.h"

using namespace ci;
using namespace ci::app;
using namespace std;

class CinderClimbApp : public App {
  public:
	void setup() override;
	void mouseDown( MouseEvent event ) override;
	void update() override;
	void draw() override;
};

void CinderClimbApp::setup()
{
}

void CinderClimbApp::mouseDown( MouseEvent event )
{
}

void CinderClimbApp::update()
{
}

void CinderClimbApp::draw()
{
	gl::clear( Color( 0, 0, 0 ) ); 
}

CINDER_APP( CinderClimbApp, RendererGl )
