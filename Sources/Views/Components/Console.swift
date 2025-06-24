//import Ignite
//import Foundation
//
//struct Console: HTML {
//    private let year = Calendar.current.component(.year, from: .now)
//    
//    var body: some HTML {
//        Section {
//            Section {
//                Section {
//                    Button {
//                        Text("Executable")
//                    }
//                    .class("radio-option radio-selected")
//                    .onClick {
//                        CustomAction("setExecutiveSelected(true)")
//                    }
//                    
//                    Button {
//                        Text("Previews")
//                    }
//                    .class("radio-option")
//                    .onClick {
//                        CustomAction("setExecutiveSelected(false)")
//                    }
//                    
//                    Text("|")
//                    
//                    Button {
//                        Image("/images/console/options.svg", description: "Console options")
//                            .resizable()
//                            .imageFit(.fit)
//                    }
//                    .class("console-button")
//                    .frame(width: .custom(LengthUnit.px(24).stringValue), height: .custom(LengthUnit.px(24).stringValue))
//                    
//                    Spacer()
//                    
//                    Span()
//                        .style(.flexGrow, "1")
//                    
//                    Span {
//                        "&copy; \(year) Jordan Christensen"
//                    }
//                    .class("copyright")
//                    
//                    Button {
//                        Image("/images/console/sidebarLeft.svg", description: "Toggle variable navigator")
//                            .resizable()
//                            .imageFit(.fit)
//                    }
//                    .class("console-button")
//                    .frame(width: .custom(LengthUnit.px(24).stringValue), height: .custom(LengthUnit.px(24).stringValue))
//                    .onClick {
//                        CustomAction("toggleLeftSidebar(); addLog('Left sidebar toggled')")
//                    }
//                    
//                    Button {
//                        Image("/images/console/sidebarRight.svg", description: "Toggle console")
//                            .resizable()
//                            .imageFit(.fit)
//                    }
//                    .class("console-button")
//                    .frame(width: .custom(LengthUnit.px(24).stringValue), height: .custom(LengthUnit.px(24).stringValue))
//                    .onClick {
//                        CustomAction("toggleRightSidebar(); addLog('Right sidebar toggled')")
//                    }
//                }
//                .class("options")
//                .id("console-options")
//                .frame(height: .px(24))
//            }
//            .class("floating")
//            .style(.right, "0")
//            .style(.paddingTop, "5px")
//        }
//        .class("console")
//        .id("console")
//        .style(.zIndex, "2")
//        
////        const { addLog, clearLogs, isShowingOptions, toggleOptionsPopover, setConsoleSize } = useConsole();
////          const { isConsoleExpanded, toggleConsole } = useSettings();
////
////          const floatingRef = useRef(null);
////          const consoleRef = useRef(null);
////          const popoverRef = useRef(null);
////          const optionsRowRef = useRef(null);
////          const optionsButtonRef = useRef(null);
////
////          const [input, setInput] = useState('');
////          const [filter, setFilter] = useState('');
////          const [isSidebarLeftOpen, setSidebarLeftOpen] = useState(true);
////          const [isSidebarRightOpen, setSidebarRightOpen] = useState(true);
////          const [isExecutableSelected, setExecutableSelected] = useState(true);
////          const [floatingSize, setFloatingSize] = useState({ width: 0, height: 0 });
////          const [optionsButtonPosition, setOptionsButtonPosition] = useState({ bottom: 0, left: 0 });
////
////          const toggleLeftSidebar = () => {
////            setSidebarLeftOpen(oldVal => !oldVal)
////
////            if (!isSidebarRightOpen) {
////              setSidebarRightOpen(oldVal => !oldVal)
////            }
////          }
////
////          const toggleRightSidebar = () => {
////            setSidebarRightOpen(oldVal => !oldVal)
////
////            if (!isSidebarLeftOpen) {
////              setSidebarLeftOpen(oldVal => !oldVal)
////            }
////          }
////
////          const handleInput = () => {
////            if (input === 'clear') {
////              clearLogs();
////            } else {
////              addLog(input, 3);
////            }
////
////            switch (input) {
////              case 'help':
////                addLog(helpMessage);
////                break;
////              default:
////                break;
////            }
////
////            setInput('');
////          };
////
////          const checkForEnterKey = (e) => {
////            if (e.key === 'Enter') handleInput();
////          };
////
////          useEffect(() => { // Calculate size of .console and .floating when .console's direct children are mutated
////            const targetNode = consoleRef.current;
////            if (!targetNode) return;
////
////            const sizeOf = node => { return { width: node.offsetWidth, height: node.offsetHeight } }
////
////            // Set size on initial load
////            setConsoleSize(sizeOf(targetNode));
////            if (floatingRef.current) setFloatingSize(sizeOf(floatingRef.current));
////
////            const config = {
////              childList: true, // Watch for direct child node additions/removals
////              subtree: false, // Do not watch for changes in descendants
////            };
////
////            const callback = (mutationsList) => {
////              for (let mutation of mutationsList) {
////                if (mutation.type !== 'childList') continue;
////
////                let wasOutputMutated = false;
////                const mutatedNodes = [...mutation.addedNodes, ...mutation.removedNodes]
////                for (let node of mutatedNodes) {
////                  if (node.nodeType !== 1 || !node.classList.contains('output')) return;
////
////                  wasOutputMutated = true;
////                  break;
////                }
////
////                if (!wasOutputMutated) continue;
////                const consoleNode = consoleRef.current;
////                if (!consoleNode) continue;
////
////                setConsoleSize({ width: consoleNode.offsetWidth, height: consoleNode.offsetHeight });
////                if (floatingRef.current) setFloatingSize({ width: floatingRef.current?.offsetWidth, height: floatingRef.current?.offsetHeight });
////              }
////            };
////
////            const observer = new MutationObserver(callback);
////            observer.observe(targetNode, config);
////
////            return () => observer.disconnect();
////          }, []); // No dependencies because this useEffect should only ever run once
////
////          useEffect(() => { // Close popover when user clicks outside of it
////            const handleClickOutside = (e) => {
////              if (
////                !isShowingOptions || // Ensure options aren't hidden
////                (optionsButtonRef.current && optionsButtonRef.current.contains(e.target)) || // Ensure click was not on the options button
////                !popoverRef.current || // Ensure popoverRef exists
////                popoverRef.current.contains(e.target) // Ensure click was not within the popover
////              ) return;
////
////              toggleOptionsPopover();
////            };
////
////            document.addEventListener('mousedown', handleClickOutside);
////          }, [popoverRef, toggleOptionsPopover, isShowingOptions]);
////
////          const calculatePosition = useCallback(() => {
////            const node = optionsButtonRef.current;
////            if (!node) return;
////
////            const rect = node.getBoundingClientRect();
////            setOptionsButtonPosition({
////              bottom: window.innerHeight - rect.bottom,
////              left: rect.left + window.scrollX
////            });
////          }, []);
////
////          useEffect(() => {
////            const getCurrentPosition = () => calculatePosition(optionsButtonRef.current);
////            getCurrentPosition();
////            window.addEventListener('resize', getCurrentPosition);
////            return () => window.removeEventListener('resize', getCurrentPosition);
////          }, [calculatePosition, optionsButtonRef]);
//    }
//}
