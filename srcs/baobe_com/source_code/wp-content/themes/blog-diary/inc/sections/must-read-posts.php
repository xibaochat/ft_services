<?php
/**
 * Must Read Posts section
 *
 * This is the template for the content of must_read_posts section
 *
 * @package Theme Palace
 * @subpackage Blog Diary 
 * @since Blog Diary  1.0.0
 */
if ( ! function_exists( 'blog_diary_add_must_read_posts_section' ) ) :
    /**
    * Add must_read_posts section
    *
    *@since Blog Diary  1.0.0
    */
    function blog_diary_add_must_read_posts_section() {
        $options = blog_diary_get_theme_options();
        // Check if must_read_posts is enabled on frontpage
        $must_read_posts_enable = apply_filters( 'blog_diary_section_status', true, 'must_read_posts_section_enable' );

        if ( true !== $must_read_posts_enable ) {
            return false;
        }
        // Get must_read_posts section details
        $section_details = array();
        $section_details = apply_filters( 'blog_diary_filter_must_read_posts_section_details', $section_details );

        if ( empty( $section_details ) ) {
            return;
        }

        // Render must_read_posts section now.
        blog_diary_render_must_read_posts_section( $section_details );
    }
endif;

if ( ! function_exists( 'blog_diary_get_must_read_posts_section_details' ) ) :
    /**
    * must_read_posts section details.
    *
    * @since Blog Diary  1.0.0
    * @param array $input must_read_posts section details.
    */
    function blog_diary_get_must_read_posts_section_details( $input ) {
        $options = blog_diary_get_theme_options();

        
        $content = array();
        $post_ids = array();

        for ( $i = 1; $i <= 3; $i++ ) {
            if ( ! empty( $options['must_read_posts_content_post_' . $i] ) )
                $post_ids[] = $options['must_read_posts_content_post_' . $i];
        }
        
        $args = array(
            'post_type'         => 'post',
            'post__in'          => ( array ) $post_ids,
            'posts_per_page'    => 3,
            'orderby'           => 'post__in',
            'ignore_sticky_posts'   => true,
            );                    

        // Run The Loop.
        $query = new WP_Query( $args );
        if ( $query->have_posts() ) : 
            while ( $query->have_posts() ) : $query->the_post();
                $page_post['id']        = get_the_id();
                $page_post['title']     = get_the_title();
                $page_post['url']       = get_the_permalink();
                $page_post['excerpt']   = blog_diary_trim_content( 15 );
                $page_post['image']     = has_post_thumbnail() ? get_the_post_thumbnail_url( get_the_id(), 'post-thumbnail' ) : get_template_directory_uri() . '/assets/uploads/no-featured-image-600x450.jpg';

                // Push to the main array.
                array_push( $content, $page_post );
            endwhile;
        endif;
        wp_reset_postdata();
            
        if ( ! empty( $content ) ) {
            $input = $content;
        }
        return $input;
    }
endif;
// must_read_posts section content details.
add_filter( 'blog_diary_filter_must_read_posts_section_details', 'blog_diary_get_must_read_posts_section_details' );


if ( ! function_exists( 'blog_diary_render_must_read_posts_section' ) ) :
  /**
   * Start must_read_posts section
   *
   * @return string must_read_posts content
   * @since Blog Diary  1.0.0
   *
   */
   function blog_diary_render_must_read_posts_section( $content_details = array() ) {
        $options = blog_diary_get_theme_options();
        $read_more = ! empty( $options['must_read_posts_btn_title'] ) ? $options['must_read_posts_btn_title'] : esc_html__( 'Read More', 'blog-diary' );

        if ( empty( $content_details ) ) {
            return;
        } ?>
        <div id="must-read" class="col-3 page-section no-padding-bottom">
            <?php if ( ! empty( $options['must_read_posts_title'] ) ) : ?>
                <div class="section-header">
                    <h2 class="section-title"><?php echo esc_html( $options['must_read_posts_title'] ); ?></h2>
                </div><!-- .section-header -->
            <?php endif; ?>

             <div class="section-content clear">
             <?php foreach ( $content_details as $content ) : ?>
                <article class="hentry">
                    <div class="featured-image" style="background-image: url('<?php echo esc_url( $content['image'] ); ?>');"></div>

                    <div class="entry-container">
                        <div class="entry-meta">
                            <?php blog_diary_posted_on( $content['id'] ); ?>
                            <span class="cat-links">
                                <?php the_category( '', '', $content['id'] ); ?>
                            </span><!-- .cat-links -->
                        </div><!-- .entry-meta -->

                        <header class="entry-header">
                            <h2 class="entry-title"><a href="<?php echo esc_url( $content['url'] ); ?>"><?php echo esc_html( $content['title'] ); ?></a></h2>
                        </header>

                       <div class="entry-content">
                            <p>
                                <?php echo esc_html( $content['excerpt'] ); ?>  
                                <a href="<?php echo esc_url( $content['url'] ); ?>">
                                    <span class="screen-reader-text"><?php echo esc_html( $content['title'] ); ?></span>
                                    <?php echo esc_html( $read_more ); ?>
                                </a>
                            </p>
                        </div>   
                    </div><!-- .entry-container -->
                </article><!-- .hentry -->
                <?php endforeach; ?>
             </div><!-- .section-content -->
        </div><!-- #must-read -->
    <?php
    }    
endif;
 