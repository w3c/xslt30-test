<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    xmlns:map="http://www.w3.org/2005/xpath-functions/map"
    xmlns="http://www.w3.org/2012/10/xslt-test-catalog"
    exclude-result-prefixes="xs math map"
    version="3.0">
    
    <xsl:output indent="yes"/>
    <xsl:mode on-no-match="shallow-skip" />
    
    <xsl:variable name="doc-sandp" select="doc('_base-expressions.xml')" />
    <xsl:variable name="exselt" static="yes"
        select="system-property('xsl:product-name') = 'Exselt' (: required to prevent Oxygen throwing errors all the time :)" />
    
    <xsl:variable use-when="$exselt" name="test" as="map(*)*" select="
        map{
            'name'          : 'striding-striding-consumingA',
            'description'   : 'Child axis on child or self axis with striding context selecting elements is striding and consuming',
            'cp'            : 'Striding',
            'rp'            : 'Striding',
            'rs'            : 'Consuming',
            'path-separators' : '/',
            'lh' : map{
                        'axes'       : ('child', 'self'),
                        'node-types' : ('element', 'any-node', 'doc-elem')
                   },
            'rh' : map{
                        'axes'       : ('child'),
                        'node-types' : ('element', 'any-node', 'doc-elem')
                   }
            },
        map{
            'name'          : 'striding-striding-consumingB',
            'description'   : 'Self axis on child axis with striding context selecting elements is striding and consuming',
            'cp'            : 'Striding',
            'rp'            : 'Striding',
            'rs'            : 'Consuming',
            'path-separators' : '/',
            'lh' : map{
                        'axes'       : ('child'),
                        'node-types' : ('element', 'any-node', 'doc-elem')
                   },
            'rh' : map{
                        'axes'       : ('self'),
                        'node-types' : ('element', 'any-node', 'doc-elem')
                   }
            },
        map{
            'name'          : 'striding-grounded-motionlessA',
            'description'   : 'Any step expression on empty selection is always grounded',
            'cp'            : 'Striding',
            'rp'            : 'Grounded',
            'rs'            : 'Motionless',
            'path-separators' : '/',
            'lh' : map{
                        'axes'       : 'any',
                        'node-types' : ('empty', 'error')
                       },
            'rh' : map{
                        'axes'       : 'any',
                        'node-types' : 'any'
                      }
            },
        map{
            'name'          : 'striding-grounded-motionlessB',
            'description'   : 'Step expressions child, namespace, attribute and descendant on a childless node kind selects nothing, is always grounded',
            'cp'            : 'Striding',
            'rp'            : 'Grounded',
            'rs'            : 'Motionless',
            'path-separators' : '/',
            'lh' : map{
                        'axes'       : ('self', 'attribute', 'namespace'),    
                                            (: cannot use parent axes here, as 'pi' etc make it free-ranging:)
                        'node-types' : ('pi', 'text', 'comment', 'attribute', 'namespace')
                       },
            'rh' : map{
                        'axes'       : ('child', 'namespace', 'attribute', 'descendant'),
                        'node-types' : 'any'
                      }
            },
        map{
            'name'          : 'striding-grounded-motionlessC',
            'description'   : 'Self-axis that changes axes selects nothing, so grounded/motionless',
            'cp'            : 'Striding',
            'rp'            : 'Grounded',
            'rs'            : 'Motionless',
            'path-separators' : '/',
            'lh' : map{
                        'axes'       : 'self',
                        'node-types' : ('element', 'document', 'attribute', 'namespace', 'comment', 'pi', 'text', 'any-node', 'elem-doc')
                       },
            'rh' : map{
                        'axes'       : 'self',
                        'node-types' : 'any',
                        'invariant'  : 'node-type-unequal'
                      }
            },
        map{
            'name'          : 'striding-grounded-motionlessD',
            'description'   : 'Descendant-or-self on childless motionless nodes with different node type selects nothing, so grounded/motionless',
            'cp'            : 'Striding',
            'rp'            : 'Grounded',
            'rs'            : 'Motionless',
            'path-separators' : '/',
            'lh' : map{
                        'axes'       : ('attribute', 'namespace'),
                        'node-types' : ('attribute', 'namespace')
                       },
            'rh' : map{
                        'axes'       : 'descendant-or-self',
                        'node-types' : 'any',
                        'invariant'  : 'node-type-unequal'
                      }
            },
        map{
            'name'          : 'striding-grounded-motionlessE',
            'description'   : 'ancestor, parent, following, preceding etc axes on document node selects nothing, so grounded/motionless',
            'cp'            : 'Striding',
            'rp'            : 'Grounded',
            'rs'            : 'Motionless',
            'path-separators' : '/',
            'lh' : map{
                        'axes'       : ('ancestor', 'parent', 'self', 'ancestor-or-self'),   (: the only axes that can select the doc node :)
                        'node-types' : ('document')
                       },
            'rh' : map{
                        'axes'       : ('ancestor', 'parent', 'following-sibling', 'preceding-sibling', 'following', 'preceding'),
                        'node-types' : 'any'
                      }
            },
        map{
            'name'          : 'striding-grounded-motionlessF',
            'description'   : 'Self axis on parent or ancestor axis which is not on U{element, document}} selects nothingness',
            'cp'            : 'Striding',
            'rp'            : 'Grounded',
            'rs'            : 'Motionless',
            'path-separators' : '/',
            'lh' : map{
                        'axes'       : ('parent', 'ancestor'),
                        'node-types' : ('element', 'document', 'any-node', 'elem-doc')
                       },
            'rh' : map{
                        'axes'       : ('self'),
                        'node-types' : ('attribute', 'namespace', 'comment', 'pi', 'text')   
                                            (: parents can only ever be in U{element, document}} (otherwise result would be empty seq :)
                      }
            },
        map{
            'name'          : 'striding-grounded-motionlessG',
            'description'   : 'Self axis on ancestor-or-self axis which is not on U{element, document}} and not on same axis as lh side selects nothingness',
            'cp'            : 'Striding',
            'rp'            : 'Grounded',
            'rs'            : 'Motionless',
            'path-separators' : '/',
            'lh' : map{
                        'axes'       : ('ancestor-or-self'),
                        'node-types' : ('element', 'document', 'attribute', 'namespace', 'comment', 'pi', 'text', 'any-node', 'elem-doc')
                       },
            'rh' : map{
                        'axes'       : ('self'),
                        'node-types' : ('element', 'elem-doc', 'document', 'attribute', 'namespace', 'comment', 'pi', 'text'),
                        'invariant'  : 'node-type-unequal'
                      }
            },
        map{
            'name'          : 'striding-grounded-motionlessH',
            'description'   : 'Ancestor-or-self axis not selecting U{element, document}} from self or ancestor-or-self axis selects nothing (if of unequal nodes), so grounded/motionless',
            'cp'            : 'Striding',
            'rp'            : 'Grounded',
            'rs'            : 'Motionless',
            'path-separators' : '/',
            'lh' : map{
                        'axes'       : ('ancestor-or-self', 'self'),
                        'node-types' : ('element', 'document', 'attribute', 'namespace', 'comment', 'pi', 'text', 'any-node', 'elem-doc')
                       },
            'rh' : map{
                        'axes'       : ('ancestor-or-self'),
                        'node-types' : ('attribute', 'namespace', 'comment', 'pi', 'text'),
                        'invariant'  : 'node-type-unequal'
                      }
            },
        map{
            'name'          : 'striding-striding-motionlessA',
            'description'   : 'Self axis on self axis remains striding and motionless if both sides select the same nodes',
            'cp'            : 'Striding',
            'rp'            : 'Striding',
            'rs'            : 'Motionless',
            'path-separators' : '/',
            'lh' : map{
                        'axes'       : 'self',
                        'node-types' : ('element', 'document', 'comment', 'pi', 'text', 'any-node', 'elem-doc')
                       },
            'rh' : map{
                        'axes'       : 'self',
                        'node-types' : ('element', 'document', 'comment', 'pi', 'text', 'any-node', 'elem-doc'),
                        'invariant'  : 'node-type-equal'
                      }
            },
        map{
            'name'          : 'striding-climbing-motionlessA',
            'description'   : 'Climbing axis parent, ancestor or ancestor-or-self on self or climbing axis is climbing and motionless',
            'cp'            : 'Striding',
            'rp'            : 'Climbing',
            'rs'            : 'Motionless',
            'path-separators' : '/',
            'lh' : map{
                        'axes'       : ('self', 'parent', 'ancestor', 'ancestor-or-self', 'attribute', 'namespace'),
                        'node-types' : ('element', 'attribute', 'namespace', 'comment', 'pi', 'text', 'any-node', 'elem-doc')  
                                            (: no document nodes for the lh, because any climbing expr would select nothing:)
                       },
            'rh' : map{
                        'axes'       : ('parent', 'ancestor', 'ancestor-or-self'),
                        'node-types' : ('element', 'document', 'any-node', 'elem-doc')   
                                            (: parents can only ever be in U{element, document}} (otherwise result would be empty seq :)
                      }
            },
        map{
            'name'          : 'striding-climbing-motionlessB',
            'description'   : 'Self axis on climbing axis, provided node type is same, inherits the climbing axis: climbing and motionless',
            'cp'            : 'Striding',
            'rp'            : 'Climbing',
            'rs'            : 'Motionless',
            'path-separators' : '/',
            'lh' : map{
                        'axes'       : ('attribute', 'namespace', 'parent', 'ancestor', 'ancestor-or-self'),
                        'node-types' : ('element', 'document', 'attribute', 'namespace', 'comment', 'pi', 'text', 'any-node', 'elem-doc')
                       },
            'rh' : map{
                        'axes'       : ('self'),
                        'node-types' : ('element', 'document', 'attribute', 'namespace', 'comment', 'pi', 'text', 'any-node', 'elem-doc'),
                        'invariant'  : 'node-type-equal'
                      }
            },
        map{
            'name'          : 'striding-climbing-motionlessC',
            'description'   : 'Climbing axis attribute, namespace on self or climbing axis with U{element}} is climbing and motionless',
            'cp'            : 'Striding',
            'rp'            : 'Climbing',
            'rs'            : 'Motionless',
            'path-separators' : '/',
            'lh' : map{
                        'axes'       : ('self', 'parent', 'ancestor', 'ancestor-or-self', 'attribute', 'namespace'),
                        'node-types' : ('element', 'any-node', 'elem-doc')  
                                            (: no document nodes for the lh, because any climbing expr would select nothing:)
                       },
            'rh' : map{
                        'axes'       : ('attribute', 'namespace'),
                        'node-types' : ('attribute', 'namespace')
                      }
            },
        map{
            'name'          : 'striding-climbing-consumingA',
            'description'   : 'Attribute, namespace, parent or ancestor(-or-self) axis on child, descendant(-or-self) axis selecting elements is climbing and remains consuming',
            'cp'            : 'Striding',
            'rp'            : 'Climbing',
            'rs'            : 'Consuming',
            'path-separators' : '/',
            'lh' : map{
                        'axes'       : ('child', 'descendant', 'descendant-or-self'),
                        'node-types' : ('element', 'document', 'any-node', 'elem-doc')
                       },
            'rh' : map{
                        'axes'       : ('attribute', 'namespace', 'parent', 'ancestor', 'ancestor-or-self'),
                        'node-types' : ('element', 'document', 'attribute', 'namespace', 'comment', 'pi', 'text', 'any-node', 'elem-doc')
                      }
            },
        map{
            'name'          : 'striding-climbing-consumingB',
            'description'   : 'Parent or ancestor(-or-self) axis on child axis selecting non U{element, document}} is climbing and remains consuming, provided rh side selects U{element, document}',
            'cp'            : 'Striding',
            'rp'            : 'Climbing',
            'rs'            : 'Consuming',
            'path-separators' : '/',
            'lh' : map{
                        'axes'       : ('child', 'descendant', 'descendant-or-self'),
                        'node-types' : ('attribute', 'namespace', 'comment', 'pi', 'text')
                       },
            'rh' : map{
                        'axes'       : ('parent', 'ancestor', 'ancestor-or-self'),
                        'node-types' : ('element', 'document', 'any-node', 'elem-doc')
                      }
            },
        map{
            'name'          : 'striding-crawling-consumingA',
            'description'   : 'A descendant(-or-self) axis on a child or descendant(-or-self) axis is crawling and consuming (scanning expression)',
            'cp'            : 'Striding',
            'rp'            : 'Crawling',
            'rs'            : 'Consuming',
            'path-separators' : '/',
            'lh' : map{
                        'axes'       : ('descendant', 'child', 'descendant-or-self'),
                        'node-types' : ('element', 'doc-elem', 'any-node')
                       },
            'rh' : map{
                        'axes'       : ('descendant', 'descendant-or-self'),
                        'node-types' : ('element', 'any-node', 'elem-doc')
                      }
            },
        map{
            'name'          : 'striding-crawling-consumingB',
            'description'   : 'A child axis on a descendant(-or-self) axis is crawling and consuming (scanning expression)',
            'cp'            : 'Striding',
            'rp'            : 'Crawling',
            'rs'            : 'Consuming',
            'path-separators' : '/',
            'lh' : map{
                        'axes'       : ('descendant', 'descendant-or-self'),
                        'node-types' : ('element', 'doc-elem', 'any-node')
                       },
            'rh' : map{
                        'axes'       : ('child'),
                        'node-types' : ('element', 'any-node', 'elem-doc')
                      }
            },
        map{
            'name'          : 'striding-crawling-consumingC',
            'description'   : 'A self axis on a descendant(-or-self) axis is crawling and consuming',
            'cp'            : 'Striding',
            'rp'            : 'Crawling',
            'rs'            : 'Consuming',
            'path-separators' : '/',
            'lh' : map{
                        'axes'       : ('descendant', 'descendant-or-self'),
                        'node-types' : ('element', 'doc-elem', 'any-node')
                       },
            'rh' : map{
                        'axes'       : ('self'),
                        'node-types' : ('element', 'any-node', 'elem-doc')
                      }
            },
        map{
            'name'          : 'striding-grounded-consumingA',
            'description'   : 'Attribute or namespace axis on child or descendant(-or-self) axis that is not in U{element}} is grounded (selects nothing) and remains consuming',
            'cp'            : 'Striding',
            'rp'            : 'Grounded',
            'rs'            : 'Consuming',
            'path-separators' : '/',
            'lh' : map{
                        'axes'       : ('child', 'descendant', 'descendant-or-self'),
                        'node-types' : ('comment', 'pi', 'text')
                       },
            'rh' : map{
                        'axes'       : ('attribute', 'namespace'),
                        'node-types' : ('attribute', 'namespace')
                      }
            },
        map{
            'name'          : 'striding-grounded-consumingB',
            'description'   : 'Self axis selecting other node-type on child, descendant(-or-self) etc axis is grounded (selects nothing) and remains consuming',
            'cp'            : 'Striding',
            'rp'            : 'Grounded',
            'rs'            : 'Consuming',
            'path-separators' : '/',
            'lh' : map{
                        'axes'       : ('child', 'descendant', 'descendant-or-self'),
                        'node-types' : ('element', 'document', 'attribute', 'namespace', 'comment', 'pi', 'text', 'any-node', 'elem-doc')
                       },
            'rh' : map{
                        'axes'       : 'self',
                        'node-types' : 'any',
                        'invariant'  : 'node-type-unequal'
                      }
            },
        map{
            'name'          : 'striding-grounded-consumingC',
            'description'   : 'Any axis with nodetest that never selects anything on a child or descendant(-or-self) axis is grounded (selects nothing) and remains consuming',
            'cp'            : 'Striding',
            'rp'            : 'Grounded',
            'rs'            : 'Consuming',
            'path-separators' : '/',
            'lh' : map{
                        'axes'       : ('child', 'descendant', 'descendant-or-self'),
                        'node-types' : ('element', 'document', 'comment', 'pi', 'text', 'any-node', 'elem-doc')
                       },
            'rh' : map{
                        'axes'       : 'any',
                        'node-types' : ('empty', 'error')
                      }
            },
        map{
            'name'          : 'striding-roaming-free-rangingA',
            'description'   : 'Any step expression selecting streamed nodes on the following(-sibling) or preceding(-sibling) axis is roaming and free-ranging',
            'cp'            : 'Striding',
            'rp'            : 'Roaming',
            'rs'            : 'Free-ranging',
            'path-separators' : '/',
            'lh' : map{
                        'axes'       : ('following', 'following-sibling', 'preceding', 'preceding-sibling'),
                        'node-types' : ('element', 'document', 'comment', 'pi', 'text', 'any-node', 'elem-doc')
                       },
            'rh' : map{
                        'axes'       : 'any',
                        'node-types' : 'any'        
                                        (: even empty or error node types, because the lh side is the part that matters :)
                      }
            },
        map{
            'name'          : 'striding-roaming-free-rangingB',
            'description'   : 'Any step expression selecting streamed nodes on the following(-sibling) or preceding(-sibling) axis is roaming and free-ranging',
            'cp'            : 'Striding',
            'rp'            : 'Roaming',
            'rs'            : 'Free-ranging',
            'path-separators' : '/',
            'lh' : map{
                        'axes'       : ('child', 'descendant', 'descendant-or-self', 'parent', 'ancestor', 'ancestor-or-self'),
                        'node-types' : ('element', 'comment', 'pi', 'text', 'any-node', 'elem-doc')        
                                            (: delib. excl. empty and document :)
                       },
            'rh' : map{
                        'axes'       : ('following', 'following-sibling', 'preceding', 'preceding-sibling'),
                        'node-types' : ('element', 'comment', 'pi', 'text', 'any-node', 'elem-doc')        
                                            (: not incl. empty and error because that might make lh side streamable :)
                      }
            },
        map{
            'name'          : 'striding-roaming-free-rangingC',
            'description'   : 'A child or descendant(-or-self) selection after a climbing expr that selects U{element, document}} is roaming/free-ranging',
            'cp'            : 'Striding',
            'rp'            : 'Roaming',
            'rs'            : 'Free-ranging',
            'path-separators' : '/',
            'lh' : map{
                        'axes'       : ('parent', 'ancestor', 'ancestor-or-self'),
                        'node-types' : ('element', 'document', 'any-node', 'elem-doc') 
                       },
            'rh' : map{
                        'axes'       : ('child', 'descendant', 'descendant-or-self'),
                        'node-types' : ('element', 'document', 'comment', 'pi', 'text', 'any-node', 'elem-doc')        
                                            (: not incl. empty and error because that makes lh side streamable :)
                                            (: includes 'document' for descendant-or-self, for child and descendant with DocumentTest the type is empty :)
                      }
            }">

    </xsl:variable>


    
    <xsl:template name="xsl:initial-template" match="/nothing" use-when="$exselt">
        <xsl:result-document href="tempresult.xml">
            <root>
                <xsl:apply-templates select="$test" />
            </root>
        </xsl:result-document>
    </xsl:template>
    
    <xsl:template match=".[. instance of map(*)]">
        <xsl:variable name="cp-rp-rs" expand-text="yes">{.('cp')!lower-case(.)}-{.('rp')!lower-case(.)}-{.('rs')!lower-case(.)}</xsl:variable>
        <xsl:variable name="filename" expand-text="yes">xp-{$cp-rp-rs}/_xp-{.('name')}-test-set.xml</xsl:variable>
        
        <!-- for the catalog -->
        <test-set name="xp-{.('name')}" file="tests/sandp/{$filename}" />
        
            <test-set name="xp-{.('name')}">
                <description xsl:expand-text="yes">
                    CP: {.('cp')}, RP: {.('rp')}, RS: {.('rs')}
                    {.('description')}
                </description>
                <xsl:apply-templates select="$doc-sandp/*/
                     productions[@axis = current()('lh')('axes') or current()('lh')('axes') = 'any']/
                     production[@node-type = current()('lh')('node-types') or current()('lh')('node-types') = 'any']">
                 <xsl:with-param name="current" select="current()" />
                </xsl:apply-templates>
            </test-set>
    </xsl:template>

    <xsl:template match="production">
        <xsl:param name="current" as="map(*)"/>
        <xsl:variable name="lh" select="current()" />
        <xsl:variable name="seqno">
            <!-- (: unfortunate repetition of the select expression :) -->
            <xsl:number level="any" count="$doc-sandp/*/
                 productions[@axis = $current('lh')('axes') or $current('lh')('axes') = 'any']/
                 production[@node-type = $current('lh')('node-types') or $current('lh')('node-types') = 'any']"/>
        </xsl:variable>
        <test-case name="xp-{$current('name')}{format-number($seqno, '000')}">
            <description xsl:expand-text="yes">
                CP: {$current('cp')!lower-case(.)}, RP: {$current('rp')!lower-case(.)}, RS: {$current('rs')!lower-case(.)}
                Base expression: {$lh}
                Separators:      {$current('path-separators')} 
                With axes:       {string-join($current('rh')('axes'), ', ')}
                With node types: {string-join($current('rh')('node-types'), ', ')}
                Invariant:       {($current('rh')('invariant'), 'none')[1]}
            </description>
            <created by="Abel Braaksma" on="{current-date()!format-date(., '[Y1, 4]-[M01]-[D01]')}"/>
            <test>
                <posture-and-sweep context-posture="{$current('cp')!lower-case(.)}">

                    <xsl:apply-templates  mode="rh-side" select="
                        (: selects the rh-side productions :)
                        $doc-sandp/*/
                            productions[@axis = $current('rh')('axes') or $current('rh')('axes') = 'any']/
                            production[(@node-type = $current('rh')('node-types') or $current('rh')('node-types') = 'any')
                            
                                (: equality between lh and rh side, either can be 'any-node', and if lh or rh side is 'elem-doc'
                                   the other side can be 'element' or 'document' :)
                                and (if($current('rh')('invariant') = 'node-type-equal') 
                                    then @node-type = ($lh/@node-type, 'any-node') 
                                        or $lh/@node-type = 'any-node'
                                        or (@node-type = ('element', 'document') and $lh/@node-type = 'elem-doc')
                                        or ($lh/@node-type = ('element', 'document') and @node-type = 'elem-doc')
                                        
                                    (: inequality between lh and rh sides, neither can be 'any-node' and if one side is 'elem-doc', 
                                       the other side cannot be 'element' or 'document' :)
                                    else if($current('rh')('invariant') = 'node-type-unequal') 
                                         then @node-type != $lh/@node-type and @node-type != 'any-node' and $lh/@node-type != 'any-node' 
                                            and not((@node-type = ('element', 'document') and $lh/@node-type = 'elem-doc')
                                                or($lh/@node-type = ('element', 'document') and @node-type = 'elem-doc'))
                                         else true())]">
                        <xsl:with-param name="current-expr" select="." />
                        <xsl:with-param name="sandp">
                            <xsl:value-of select="$current('cp'), $current('rp'), $current('rs')" separator=", " />
                        </xsl:with-param> 
                    </xsl:apply-templates>
                    
                </posture-and-sweep>
            </test>
            <result>
                <assert-posture-and-sweep result-posture="{$current('rp')!lower-case(.)}" result-sweep="{$current('rs')!lower-case(.)}"/>
            </result>
        </test-case>
    </xsl:template>
    
    <xsl:template match="production" mode="rh-side">
        <xsl:param name="current-expr" />
        <xsl:param name="sandp" />
        <xpath xsl:expand-text="yes">{$current-expr || '/' || .}</xpath>
    </xsl:template>
    
</xsl:stylesheet>